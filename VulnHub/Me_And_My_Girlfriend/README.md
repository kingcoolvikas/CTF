# VulnHub :  Me and My Girlfriend CTF Walkthrough

![image](Images/2021-04-10_18-43.png)


</br>

So, Hey Guys This is Vikas Anand. This is Second CTF Walkthrough.

</br>

This CTF is from VulnHub ["Me_and_My_Girlfriend"](https://www.vulnhub.com/entry/me-and-my-girlfriend-1,409/) So Download the CTF and let's Hack the CTF cheers

</br>

    First Find the IP address of the machine I'm using Netdiscover :


` sudo netdiscover `

![netdiscover](Images/2021-04-10_18-44.png)

Here the IP is _192.168.43.98_


    Then Scan the Machine with Nmap :

`
sudo nmap -A -O 192.168.43.98
`

![nmap](Images/Nmap_Scan.png)

Here We can see 2 Ports Open :

1. 22 - ssh
2. 80 - http

</br>
     
    Now check the http port website in firefox :
</br>

![webiste](Images/Website.png)

    After checking the source code of the website we get : 

![Source_code](Images/Source_Code.png) 

    We can see that the site can be locally accesiible. So we will use Burpsuite x-forwared method :

![Burpsuite](Images/Burpsuite.png)

* Goto Proxy
* Goto Options
* Goto Match and Replace
* CLick on the line where comment ="Add spoofed CORS origin"
* Replace with "x-forwarded-for:localhost"
* Click ok. Turn on the intercept
* Make sure your Firefox proxy is enable
* just reload the website then turn off the intercept
* Boom You'll see a Login Page.  

![Register](Images/Register.png)

    Just click on Register and Enter any fake name,email,username and password. And login with the username and password.

We can see that the Password is shown but in dotted form. If we check the source page of this website we can clearly see the password.   

![Password](Images/Password.png)

    Also we can see that this url id is 13. By changing url id we can see many username and passwords. In the id 5 we get,

![id](Images/2021-04-10_18-52.png)
![id_pass](Images/2021-04-10_18-52_1.png)

    Also, In the Nmap scan we get ssh port open. Let's Connect SSH using this id and pass.

` ssh alice@192.168.43.98 `

![ssh](Images/2021-04-10_18-54.png)

    In the Alice Directory We get our first Flag.

![alice](Images/2021-04-10_18-57.png)

    Now to get Second flag we have to escalate our privilages as root.

![root](Images/2021-04-10_19-35.png)

    We can see that php is Vulnerable so we will enjact some code of php to access the root.

`
variable="/bin/bash"
`
</br> 
`
sudo /usr/bin/php -r "system('$variable');"
`


![root_access](Images/2021-04-10_19-32.png)

    Finally we Got our Both Flag. 

Thanks for reading the entire Walkthrough.