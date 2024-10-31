FROM nikolaik/python-nodejs:python3.11-nodejs20

# 添加 CACHEBUST 参数
ARG CACHEBUST=1

ENV USER=pn \
    HOMEDIR=/home/pn \
    PORT=7860 \
    SSHX_INSTALL=true \
    GRADIO_SERVER_NAME="0.0.0.0" \
    GIT_REPO="https://github.com/aigem/hf-roop-unleashed-cpu.git" \
    PROJECT_NAME="aigem-roop-unleashed"
    
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    build-essential \
    libpq-dev \
    git \
    curl \
    vim \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR ${HOMEDIR}

# 克隆项目到 ${HOMEDIR}/${PROJECT_NAME}
RUN git clone ${GIT_REPO} ${HOMEDIR}/${PROJECT_NAME} \
    && chmod +x ${HOMEDIR}/${PROJECT_NAME}/src/*.sh \
    && if [ "$SSHX_INSTALL" = true ]; then ${HOMEDIR}/${PROJECT_NAME}/src/sshx.sh; fi \
    && ${HOMEDIR}/${PROJECT_NAME}/src/roop-unleashed.sh

# 暴露 Remix 端口
EXPOSE ${PORT}

# 启动
ENTRYPOINT python ${HOMEDIR}/app/run.py
