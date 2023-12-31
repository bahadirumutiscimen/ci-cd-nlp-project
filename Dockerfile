# Resmi Python Docker imajını kullanın
FROM python:3.9

# Uygulama dizini oluşturun ve çalışma dizini olarak belirleyin
WORKDIR /app

# Uygulama bağımlılıklarını kopyalayın ve yükleyin
RUN python -m pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN python -m textblob.download_corpora

EXPOSE 8000
# Uygulama dosyalarını kopyalayın
COPY . .
# Uygulamayı çalıştırın
CMD ["python", "app.py"]
