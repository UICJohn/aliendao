# 从Huggingface下载模型（断点续传）

## 1、安装python虚拟环境

```bash
# windows到Anaconda官网下载安装
# Linux用以下方法安装
wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh
chmod +x Anaconda3-2022.10-Linux-x86_64.sh
./Anaconda3-2022.10-Linux-x86_64.sh
source ~/.bashrc
```

## 2、创建虚拟环境

```bash
git clone https://github.com/git-cloner/aliendao
cd aliendao
conda create -n aliendao python=3.10 -y
conda activate aliendao
pip install -r requirements.txt -i https://pypi.mirrors.ustc.edu.cn/simple --trusted-host=pypi.mirrors.ustc.edu.cn
```

## 3、下载

```bash
conda activate aliendao
# 下载模型，带上mirror优先从镜像下载
python model_download.py --repo_id 模型ID
# 举例
python model_download.py --repo_id baichuan-inc/Baichuan-7B
# 下载数据集
python model_download.py --repo_id 数据集ID --repo_type dataset
# 举例
python model_download.py --repo_id tatsu-lab/alpaca --repo_type dataset

```

## 4、使用docker下载

```bash
docker run -v /path/to/wherever/you/want:/root/aliendao/dataroot/models johnatmars/aliendao:latest python /root/aliendao/model_download.py --repo_id meta-llama/Llama-2-7b-chat-hf

如果需要验证身份
# 1 本地终端登录huggingface
# 2 mount本地的hugginface文件
docker run -v /path/to/huggingface/cache:/root/.cache/huggingface  -v /path/to/wherever/you/want:/root/aliendao/dataroot/models johnatmars/aliendao:latest python /root/aliendao/model_download.py --repo_id meta-llama/Llama-2-7b-chat-hf

```
