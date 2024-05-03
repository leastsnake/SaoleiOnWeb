FROM nginx:alpine
RUN mkdir -p /app /usr/share/nginx/html/Images/Cells /usr/share/nginx/html/Images/Digits /usr/share/nginx/html/Images/Faces
WORKDIR /app
COPY dist/* /app/
COPY dist/Images/Cells/*  /app/Images/Cells/
COPY dist/Images/Digits/*  /app/Images/Digits/
COPY dist/Images/Faces/*  /app/Images/Faces/
RUN rm /usr/share/nginx/html/*.*
RUN cp /app/Images/Cells/*  /usr/share/nginx/html/Images/Cells/
RUN cp /app/Images/Digits/*  /usr/share/nginx/html/Images/Digits/
RUN cp /app/Images/Faces/*  /usr/share/nginx/html/Images/Faces/
RUN cp /app/*.*  /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
