# This is environment for AtCoder with Ubuntu

## Available languages

- Python3.8
- PyPy3

## DockerHub repository
https://hub.docker.com/repository/docker/haruto2001/atcoder-env

## docker compose reference
https://docs.docker.com/engine/reference/commandline/compose/

## Usage
### 1. Create directry
<pre>
.
├── Dockerfile
├── docker-compose.yml
└── src/
    ├── (file_name.py)
            ︙
</pre>

### 2. Create and start container (--detach)
- `docker compose up -d`

### 3. Enter in running container with bash
- `docker compose exec container_name bash`

### 4. Run .py files
- `python file_name.py`
- `pypy file_name.py`
