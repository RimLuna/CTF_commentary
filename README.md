# CTF_commentary
Fucking commentary on CTFs I play. I'm so full of shit.

## ACS IXIA CTF 2021
*https://acs-ixia-ctf.security.cs.pub.ro/*

What a weird fucking name.
## Misc: of course I will start with Misc cuz I like FUN
### Warm-up 2021
Read the rules. *wtf I never fucking read the rules, it's Ramadan for god's sake*. 

So in the rules: they give `ACS_IXIA_CTF{Some_random_string}` as the format. I submitted it, *nope*.

So Nothing, then I read that you need to change your role on Discord, and as soon as I did, `ACS_IXIA_CTF{Welcome_to_the_IXIA_2021_CTF_Have_Fun!}` got this on Discord. YAY!
### Beware The Hackerman
Hackerman saw this Netflix documentary about spies dead dropping encoded messages in plain sight.

He gave it a try.

With a zip file attached. the gif looks like a bald guy breaking a computer?? *the fuck*. Found this tool *https://ezgif.com/split*, tried converting it to video, for fun, otherwise, I *REALLY* dk what I'm doing.

So the gif actually contains 3 pictures; I couldnt even split it into frames using that useless tool. *kill me*. 
### Git Tutorial
*https://github.com/lizababu/git-is-love* given this, find the flag?

So many *fucking* files. So I did a little `git log -p` on the repo. Holy *fuck*, fucking adding character by character. *KILL ME*. Saved the logs in a logs file. 

## Web (I wanna see all the challenges)
### Fast Cookie
The website returns {"detail":"Not Found"} and 404. No cookies whatsoever. I tried *dirsearch*.

Found `http://141.85.224.117:8001/docs` 

so it contains some kind of docs for the api, after playing around with the requests, found that a `{"cookie":"_IXIA_"}` appears when requesting urls twice

So, *http://141.85.224.117:8001/cookie2* gives `{"cookie":"_IXIA_"}`

*http://141.85.224.117:8001/cookie1*, `{"cookie":"ACS"}`

*http://141.85.224.117:8001/cookie3*, `{"cookie":"CTF{"}`

*http://141.85.224.117:8001/cookie4*, `{"cookie":"User_"}`

*http://141.85.224.117:8001/cookie5*, `{"cookie":"I_am_"}`

*http://141.85.224.117:8001/cookie6*, `{"cookie":"your_cookie}"}`

*TADA*, flag is ACS_IXIA_CTF{User_I_am_your_cookie}

## Ping App, but very secure
Previous pinging apps were pretty unsafe (risky, ikr), but we fixed all of issues. Check it out: http://141.85.224.118:61180/

The web app gives a field for an IP to ping, and the response
```
PING 141.85.224.118 (141.85.224.118) 56(84) bytes of data.
64 bytes from 141.85.224.118: icmp_seq=1 ttl=62 time=1.56 ms

--- 141.85.224.118 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 1.560/1.560/1.560/0.000 ms
```
using *dirsearch* again, since that's all I know in life, `[15:01:48] 200 -  757B  - /backup.zip`, noice, found an index,js inside
```
function validate_ip (ip) {
	var r = /^(\d{1,3})\.(\d{1,3})\.(\S{1,24})\.(\d{1,3})$/gmi;
	return r.test(ip);
}

app.post("/", function (req, res) {
	var ip = req.body.ip;

	if (!ip || !validate_ip(ip))
		return res.status(401).send('Invalid IP address');

	var output = c.execSync("ping -c 1 " + ip).toString();

	res.send('<pre>' + output + '</pre>');
})
```
*the fuck*, I don't wanna read that. I wanna try *command injection*, cuz that all I know in life.

So I need to inject the payload in the ip address, the regular expression is `/^(\d{1,3})\.(\d{1,3})\.(\S{1,24})\.(\d{1,3})$/gmi`, so I can put the payload in `(\S{1,24})` here, /gmi are flags I guess, *fuck js*

tried  `10.10.;ls;.10` nope.

## Peas in a Pod
The flag is found at `141.85.224.119`.
You can log in as `ashley` with password `student`.

went to `http://141.85.224.119/login.php`, loggeed in as ashley, didnt even ask for a password, *the fuck*

went to `http://141.85.224.119/index.php/login`, oh *wtf* this is a crypto challenge? I'm out
## Step by step
Write what you want to get what you need. Get the flag from 141.85.224.109:31339.
Hint! The flag is located at the path: /home/ctf/flag

wtf the ip returns **ERR_INVALID_HTTP_RESPONSE**, *the fuck is this*. 

but it is *pingable*, if thats even a word.
```
C:\Users\othmane\Desktop\dirsearch> ping 141.85.224.109     

Pinging 141.85.224.109 with 32 bytes of data:
Reply from 141.85.224.109: bytes=32 time=123ms TTL=43
Reply from 141.85.224.109: bytes=32 time=123ms TTL=43

Ping statistics for 141.85.224.109:
    Packets: Sent = 2, Received = 2, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 123ms, Maximum = 123ms, Average = 123ms
```
*kill me*, let's try *nmap*. weird output on that weird *fucking* port.

Because this isn't a Web challenge, I'm guessing no web shit involved.

## Friendly CTF by Cyber Trace
*https://ctf.cyber-trace.tn/*

This shit started already, *fucking hell*.

### Sanity Check
Here is your First flag: CyberTrace{Say_Welc0me_T0_our_BOT_inept}

*noice*

### Cyber-Trace Social Media
`CyberTrace{c0n6r475_y0u_m4d3_17}`, noice

### Web: F12
`<!--CyberTrace{always_1nsp3ct}-->` tada

### Misc: Cyber-Trace Ineptitude
a corrupted JPG file I guess, using *https://online.officerecovery.com/fr/pixrecovery/*, got a new jpg that's *fucking* blurry as *fuck*.

### Reverse: DisAsm
a `main.asm` submitted, 

## BambiCTF: fucking bambi
*https://bambi.enoflag.de/*

I don't even know what the fuck this is, sounds cute. Some Attack/Defense CTF for Beginners.
