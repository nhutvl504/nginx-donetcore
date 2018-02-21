FROM microsoft/dotnet:latest
 
RUN apt-get update
RUN apt-get install -y nginx
 
WORKDIR /app
COPY App/ .
RUN  dotnet restore
RUN  dotnet publish -c Release -o out
RUN pwd && ls -lsa
COPY App/bin/Release/netcoreapp2.0/ .  
 
COPY ./startup.sh .
RUN chmod 755 /app/startup.sh
 
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx
 
ENV ASPNETCORE_URLS http://+:5000
EXPOSE 5000 80
 
CMD ["sh", "/app/startup.sh"]
