import os

username="jtly5039"
password="jtly9572713"
com="wget -q -O - https://"+username+":"+password+"@mail.google.com/mail/feed/atom --no-check-certificate"
# com='curl -s -u "{}:{}" https://mail.google.com/mail/feed/atom'.format(username, password)
temp=os.popen(com)
msg=temp.read()
index=msg.find("<fullcount>")
index2=msg.find("</fullcount>")
fc=int(msg[index+11:index2])
print(str(fc)+" new")
