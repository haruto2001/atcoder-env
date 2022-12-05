FROM ubuntu:20.04

# タイムゾーンを日本に設定
ENV TZ=Asia/Tokyo

# Python, PyPyとその他のモジュールをインストール
# *DEBIAN_FRONTEND=noninteractiveはtzdataのインストール時にタイムゾーン入力をスキップするため
# *llvm-7はnumbaのインストールに必要
RUN apt update && DEBIAN_FRONTEND=noninteractive \
    apt install -y time tzdata tree build-essential llvm-7 python3.8 python3-pip pypy3

# デフォルトシェルをzshに設定
RUN chsh -s /bin/zsh

# 環境変数の設定
# *LLVM_CONFIGは必須
ENV LLVM_CONFIG /usr/bin/llvm-config-7

# コマンドを簡略化
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 30 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 30 && \
    update-alternatives --install /usr/bin/pypy pypy /usr/bin/pypy3 30

# これがないとライブラリ(scipy)のインストール時にエラーになる
RUN apt install -y gfortran libopenblas-dev liblapack-dev

# Python用のライブラリをインストール
# *cythonはscikit-learnのインストールに必要
# *llvmliteはscikit-learnのインストールに必要
RUN pip install --upgrade pip setuptools wheel && \
    pip install cython && \
    pip install llvmlite && \
    pip install numpy==1.18.2 && \
    pip install scipy==1.4.1 && \
    pip install scikit-learn==0.22.2.post1 && \
    pip install numba==0.48.0 && \
    pip install networkx==2.4

WORKDIR /root/src/