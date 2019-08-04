## Crypto Lab - Public Key Cryptography and PKI
### Description of the scenario
This lab was created in order for the students to understand how PKI works. The students will understand the core functions of PKI such as protecting the web, and defeating Man in the Middle attack. Furthermore, students will understand the root of the trust in PKI and the problems that arise when the root CA (Certificate Authority) is compromised. 
### Target Audience
**Instructors**  
If you are an instructor teaching cybersecurity concepts, this lab can be used to provide hands-on experience on implementing a root CA, understanding some of the OpenSSL commands to produce Public/Private key pairs, creating a certificate signing request, signing a certificate, and so on. 
  
**Students**  
If you are a student studying cybersecurity concepts, it is essential for you to understand how PKI works since it is a widely used technique when browsing websites using HTTPS. Students will implement a root CA using OpenSSL, sign a certificate, deploy certificate using Apache-Based HTTPS website, and conduct a man in the middle attack using a compromised root CA. 
### Design and Architecture  
This lab can be completed by using one VNC container. The container comes with all the necessary tools such as *vim* text editor, *openssl* libraries, *Apache webserver*, and *firefox* webbrowser. Students will edit the */etc/hosts* file to host an Apache webserver in it's own container. 

### Installation and Usage
In order to build the image, type in the following commands in the terminal.  
```source
cd pki
docker build -t pki .
```
After the image has been created, you will be able to run the container by typing in
```source
docker run -d -p 80 pki  
```  
You will be able to figure out the port number by typing in
```source
docker ps
```
You will be able to access the container by opening any web browser and typing in the following ip address. 
```source
0.0.0.0:<port number>
```
### Usage  
Upon successful access to the container, user will have access to the VNC interface which contains access to the terminal, vim text editor, and firefox web browser. 
### How to contribute
To report issues or contribute enhancements to this application, open a GitHub issue.
This lab was provided by [Seed lab](https://seedsecuritylabs.org/Labs_16.04/Crypto/Crypto_PKI/).

