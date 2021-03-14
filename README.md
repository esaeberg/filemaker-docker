# A FileMaker Server Docker Image

A FileMaker Server docker image.

# Know Isues

For now, it's impossible to connect to the admin and the fmsadmin resetpw cmd don't reconnise the pin code ...

## First thing to do

You need to replace "PUT_HERE_YOUR_PERSONNAL_URL" in the Dockerfile with the link of the filemaker server you want install

and add your "LicenseCert.fmcert" in your directory with others files 

## Command to build

```
docker build -t fms19 .
```

## Command to start

```
docker run -it -p 5003:5003 -p 16000:16000 -p 443:443 -p 80:80 -p 16001:16001 fms19
```

## Reset default credentials

```
fmsadmin resetpw -p [pass] -z 1234
```
