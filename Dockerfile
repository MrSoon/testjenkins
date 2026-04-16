FROM nginx:alpine
# Copy toàn bộ code HTML vào thư mục mặc định của Nginx
COPY . /usr/share/nginx/html