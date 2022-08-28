# Inception
Créer une server web avec Docker

## C'est quoi ?
<details><summary>Explications de notions</summary>

### C'est quoi Docker ?
Docker est une solution qui permet de faire tourner des application dans un environnement fermé appelé *container*. Docker à la capacité d'en faire tourner plusieurs en meme temps. Et permet d'assurer plus facilement la portabilité des services qui ceux trouvent toujours dans le meme environemment.
</br>*[source](https://docs.docker.com/get-started/overview/)*

### C'est quoi un Container ?
Un container est une methode de virtualtisation au niveau du systeme d'exploitation. Concrètement cela permet d'avoir des OS, CPU, memoires, reseaux... séparé tous en utilisant le meme kernel (celui de la machine host), ce qui est beaucoup moins lourd que un machine virtuelle.
</br>*[source 1](https://en.wikipedia.org/wiki/LXC) | [source 2](https://en.wikipedia.org/wiki/OS-level_virtualization)*


### C'est quoi la difference entre un processus et un service ?
Un processus est une application qui tourne par defaut.</br> Un service est une application que l'on doit lancer (par une commande). 
</br>[source](https://www.unixmen.com/managing-your-services-and-processes-in-linux/#:~:text=A%20process%20is%20simply%20an,the%20foreground%20or%20the%20background.&text=Service%20is%20a%20command%20which,services%20running%20in%20the%20background.)

### C'est quoi une image Docker ?
L'image docker est le fichier avec lequel le container va boot. Il est "l'etat de base/ par default" du container.
</br>*[source1](https://www.techtarget.com/searchitoperations/definition/Docker-image) | [source 2](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Dockerfile-vs-docker-compose-Whats-the-difference)*

### C'est quoi un Dockerfile ?
C'est un fichier qui permet de creer l'image du container.
</br>[source](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Dockerfile-vs-docker-compose-Whats-the-difference)

### C'est quoi un Docker Compose ?
docker-compose.yml est le fichier qui va permettre de lancer, arreter ... ces images.
</br>*[source](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Dockerfile-vs-docker-compose-Whats-the-difference)*


### C'est quoi TLS ?
C'est un protocole de cryptographie qui assure la securitee des donnees dans un resau. Il est par exemple le protocole de securite de HTTPS.
</br>*[source](https://en.wikipedia.org/wiki/Transport_Layer_Security)*


### C'est quoi NGINX ?
NGINX est un server HTTPm ici utilise comme reverse proxy, qui peut supporter beaucoup plus trafic simultanée que Apache par exemple.
</br>*[source](https://en.wikipedia.org/wiki/Nginx)*

### C'est quoi WordPress ?
Permet de creer le site de A a Z. **(a preciser)**
</br>*[source](https://fr.wikipedia.org/wiki/WordPress)*

### C'est quoi php-fpm ?
Le code PHP sera nos pages internet qui seront donc chercher puis envoyee par NGINX en fonction des requetes qui lui sont faites. FPM est donc un service qui va interpreter le code PHP chercher de potentiel donner dynamiques(dans la DB) avant de l'envoyer a NGINX en html qui lui va l'envoyer au client.
</br>*[source 1](https://www.youtube.com/watch?v=I_9-xWmkh28) | [source 2](https://www.youtube.com/watch?v=6QGskEOIS9E)*
  
### C'est quoi MariaDB ?
MariaDB est simplement un service qui va strocker nos donnees dans des "tables". Ce sera notre Data Base.

### C'est quoi un docker-network ?
De base Docker fait communiquer tous les containers entre eux via le docker network. Mais dans de nombreux cas on veut une configuration specifique au niveau de nos resaux. Comme isoler certain, en faire communiquer d'autre ou lier nos containers a la machine Hote. Tous cela est possible grace au plugin docker network
</br>*[source](https://www.youtube.com/watch?v=5grbXvV_DSk)*

### C'est quoi le PID1 ?
Le pid1 est le processus sur la machine qui porte le numero 1. 
Il a certaine particularitee : 
* When the process with pid 1 die for any reason, all other processes are killed with KILL signal
* When any process having children dies for any reason, its children are reparented to process with PID 1
* Many signals which have default action of Term do not have one for PID 1
Ca qui fait que si le programme n'est pas prevu pour tourner en PID1 il marche mal. C'est le cas de docker (voir source 2).
</br>*[source 1](https://vagga.readthedocs.io/en/latest/pid1mode.html) | [source 2](https://petermalmgren.com/signal-handling-docker/)*
  
</details>

## Pourquoi ?
<details><summary>Utilité de choses faites dans le projet</summary>

### Pourquoi faire un container par processus ?
  
### Pourquoi ne pas utiliser un container comme une VM ?
  Attention un container n'est pas une VM. Ils doivent etres utiliser diffremment.
  Par exemple si vous voulez faire une update dans le container et que executer simplement la commande d'update dans celui-ci l'image du container sera toujours sur l'ancienne version
  
</details>


## À implémenter
* [X] Un container Docker contenant NGINX avec TLSv1.2 ou TLSv1.3 uniquement.
* [X] Un container Docker contenant WordPress + php-fpm (installé et configuré) uniquement sans nginx.
* [X] Un container Docker contenant MariaDB uniquement sans nginx.
* [X] Un volume contenant votre base de données WordPress.
* [X] Un second volume contenant les fichiers de votre site WordPress.
* [X] Un docker-network qui fera le lien entre vos containers.

## Créer le Docker file de NGINX et TLS
<details><summary></summary>

</br>

C'est facultatif mais il est bien de mettre un moyen d'etre contacte dans dans les meta-donnees du container grace a `LABEL`.

`LABEL maintainer=name<mail@domain>`

---

Nous basons notre image sur une os `FORM` debian:buster dans notre cas. Ce sera la seul image que nous utiliserons de docker hub dans ce projet.

`FROM image_form_dockerhub:tag`

Le tag est une image specifique de l'image.

---

`RUN` est une commande qui permet de lancer des commande shell dans le container.

-it permet de mettre le container en mode interactif. Il reste ouvert et on peut ecrire dans sont shell.

--name pour nommer l'image

---

`ADD` permet de d'ajouter dans le container des fichier via la machine hote.

---

`WORKDIR` change le repertoire courant du container, toutes les commande du container seront execute dans ce repertoire

---

A chaque commande du Dockerfile un nouveau container est cree. L'image final du container est un superposition de ces containers appele "couche". Si l'image est re run les couches non changees ne sont pas rebuild. Si elles ont change tous est rebuild depuis la ligne qui a changee. Ainsi si on a un fichier que l'on veut `ADD` mais qui change beaucoup on va l'ajouter au dernier moment possible.

`ADD . /app` <- rebuild a partir d'ici si "." change</br>
`run install something` <- donc something est encore installe pour rien</br>

`run install something` <- something pas reinstalle car ne change pas</br>
`ADD . /app` <- rebuild a partir d'ici si "." change</br>

---

On va commencer par installer les service dont on a besoin.
* Tout d'abord on update les packages list depuis lesquelles on va telecharger et upgrade les packages.
* Puis install nginx
* Enfin install Openssl qui est un library qui a TLS 1.2

On va tous faire en une fois pour le faire en une couche.

```Dockerfile
RUN		apt-get update \
&&		apt-get clean \
&&		apt-get install nginx -y \
&&		apt-get install openssl -y
```

---


De base et dans un serveur normal nginx est par defaut :

`nginx -g daemon on`

Car un serveur fait plusieurs actions en meme temps et donc voulons que le service tourne en tache de fond.

Avec Docker nous allons mettre :

`CMD ["nginx", "-g", "daemon on;"]`

Car nous avons seulement 1 service par container. Il faut egalement souligner que sans cette option le container exit juste apres avoir run car il n'a plus rien a faire en premier plan.


---

Pour faire notre serveur web nous allons creer un container par service. Il serait donc pas pratique de faire `docker run -option image` pour chaque service. On a donc docker-compose qui est un fichier sous format yml qui va nous permettre de faire ca. 

Voici a quoi ressemble le service dans notre docker compose pour nginx-tls :

```yml
services: 
  nginx-tls:
    build: .
    container_name: nginx-tls
    ports:
      - "80:80"
      - "443:443"
    restart: always
```

---

Pour lancer vos containers faites `docker-compose run`  ou `docker-compose run -d` pour lancer le/s containers en tache de fond.

Pour vous faciliter la vie vous pouvez aussi utiliser --remove-orphans pour override un service qui serait deja en route mais qui aurai le meme nom, mais faites attention ducoup.

Si vous rencontrez une erreur du type 

` => ERROR [internal] load metadata for docker.io/library/debian:buster`

Ouvrez ~/.docker/config.json et modifier `credsStore` en `lcredStore`

Le fichier changer a chaque redemarrage donc vous pouvez mettre 

```sh
echo "{
  \"credStore\": \"desktop.exe\"
}" > ~/.docker/config.json
```

dans votre .bash/zshrc

---

Maintenant on va pourvoir passer a la configuration de nginx en tant que web server et reverse proxy

Tout d'abord on va creer un fichier en local sur la machine host avec une extension .conf.

Commencons par la config. http :

```
server { 
		listen 80; #ipv4
		listen [::]:80; #ipv6
		server_name login.42.fr www.login.42.fr;
		return 301 https://$server_name$request_uri; 
}
```

Nous voulons que toutes les requets http (port 80) en ipv4 ou ipv6 soit rediriger vers le port 443 (site en https).
* 301 : code html de redirection permanante
* https : envoyer sur port 443
* $server_name : variable nginx que nous avons initaliser avant
* $request_uri : variable nginx qui est l'endroit du site dans lequel est le user

Puis on fait la config https :

```
server {
	listen 443 ssl;
	listen [::]:443 ssl;

	ssl on; 
	ssl_certificate x;
	ssl_certificate_key y;

	server_name login.42.fr www.login.42.fr;

	location / { 
		root /var/www/html;
		index index.html index.htm index.nginx-debian.html;
	}
}
```

A cette etape il faut creer un certificat et un clef ssl sur la machine host avec `sudo openssl req x509 -nodes -days 3650 -newkey rsa:2048 -sha384 -keyout server-cert.key -out server-cert.crt` qui vous permez de creer une clef auto signer d'une validite de 10 ans avec une encryption sha384 appele server-cert.key et un certificat appele server-cert.crt

---

Nous allons maintenant rendre accessible nos fichier locaux dans notre container grace aux volumes.

Dans notre docker-compose on peut ajouter :

```
volumes:
      - ./requirements/nginx/conf/core.conf:/etc/nginx/conf.d/core.conf:ro #change location of volume in /home/hkovac/data
      - ./requirements/nginx/conf/auth_ssl:/var/ssl/:ro
```

local_dir/file:container_dir/file:readonly

Ces fichier sont juste des link donc quand vous allez les modifier en local ils seront update meme pendant le run time du container.

---

Nous allons donc modifier dans notre .conf

```
	ssl_certificate /var/ssl/server-cert.crt;
	ssl_certificate_key /var/ssl/server-cert.key;
```

---

Pour aider au debug de votre config vous pouvez lancer vo(s) containers en mode demon et faire `docker-compose exec nom_image bash` et apres avoir modier le fichier faire nginx -s reload dans le container.

---

Pour ce simplifier la vie on veut que lorsqu'on tape login.42.fr on soit rediriger vers notre ip local (chez moi 127.0.0.1).

Pour ce faire on modifie `/etc/hosts` :

```
127.0.0.1       localhost hkovac.42.fr www.hkovac.42.fr <- ici
127.0.1.1       inception-VirtualBox
```

</br>
<details><summary>source </summary>

* [Apprendre a faire un Dockerfile](https://putaindecode.io/articles/les-dockerfiles/)</br>
* [Docker RUN options](https://phoenixnap.com/kb/docker-run-command-with-examples)</br>
* [Toutes les commandes docker expliquee](https://buddy.works/tutorials/docker-commands-cheat-sheet)</br>
* [Comment fonctionne TLS](https://www.youtube.com/watch?v=7W7WPMX7arI)</br>
* [Laisser le container tourner (avec des daemon)](https://docs.docker.com/engine/security/rootless/#daemon)</br>
* [docker run -dt](https://www.youtube.com/watch?v=-i7LGwKsRSM)</br>
* [DockerFile best practices Doc](https://docs.docker.com/get-started/09_image_best/)</br>
* [DockerFile for NGINX Doc](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-docker/)</br>
* [DockerFile Doc (keywords)](https://docs.docker.com/engine/reference/builder/)</br>
* [SSL on nginx](https://www.youtube.com/watch?v=wQcSql62zRo)</br>
* [Nginx Docker et Wordpress](https://www.youtube.com/watch?v=786dRn1Ioug)</br>

</details>

</details>


# Ce readme sera peut-être fini un jour, peut-être pas ...

