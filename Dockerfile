FROM nginx:latest
copy ..
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
