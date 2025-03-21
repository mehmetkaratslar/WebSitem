# Resmi Python 3.10 Slim imajını çekiyoruz
FROM python:3.10-slim

# Gerekli paketleri yükleyelim
RUN apt-get update && apt-get install -y \
    python3-dev build-essential \
    && rm -rf /var/lib/apt/lists/*  # Gereksiz dosyaları temizleyerek imajı küçültelim

# Ortam değişkenlerini ayarlıyoruz
ENV PYTHONDONTWRITEBYTECODE=1
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Pip'i ve virtualenv'i güncelleyelim ve sanal ortam oluşturalım
RUN pip install --upgrade pip && \
    pip install virtualenv && \
    python -m virtualenv $VIRTUAL_ENV

# Gereksinimleri yükleyelim
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Proje dosyalarını kopyalayalım
COPY . /WebSitem/app
WORKDIR /WebSitem/app
