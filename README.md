# Inception
Créer une machine virtuelle avec Docker

## C'est quoi ?
<details><summary>Explications de notions</summary>

### C'est quoi Docker ?
Docker est une solution qui permet de faire tourner des application dans un environnement fermé appelé *container*. Docker à la capacité d'en faire tourner plusieurs en meme temps. Et permet d'assurer plus facilement la portabilité des services qui ceux trouvent toujours dans le meme environemment.
</br>*[source](https://docs.docker.com/get-started/overview/)*

### C'est quoi un Container ?
Un container est une methode de virtualtisation au niveau du systeme d'exploitation. Concrètement cela permet d'avoir des user space, serveur virtuel privé, partition, environemment... séparé tous en utilisant le meme kernel (celui de la machine host), ce qui est beaucoup moins lourd que un machine virtuelle.
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
docker-compose.yml est le fichier qui va permettre de *"run"* la partie applicative du container, c'est a dire les service et processus a lancer, reboot, shut ...
</br>*[source](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Dockerfile-vs-docker-compose-Whats-the-difference)*


### C'est quoi TLS ?
C'est un protocole de cryptographie qui assure la securitee des donnees dans un resau. Il est par exemple le protocole de securite de HTTPS.
</br>*[source](https://en.wikipedia.org/wiki/Transport_Layer_Security)*

### C'est quoi Adminer ?
C'est un outil qui permet de gerer le contenu des bases de donnee. Pour par exemple inserer, modifier, chercher dans les base de donnees.
</br>*[source](https://en.wikipedia.org/wiki/Adminer)*

### C'est quoi Redis Cache ?
Redis ou Remote dictionary Server permet de stocker le cache de WordPress dans un objet persistant de data structures specifiques.**(a preciser)**
</br>*[source 1](https://en.wikipedia.org/wiki/Redis) | [source 2](https://kinsta.com/help/redis-cache/)*

### C'est quoi FTP ?
FTP ou File Transfert Protocol est un protocol de communication qui permet de transferer des fichier d'un server a un client dans un resau internet.
</br>*[source](https://en.wikipedia.org/wiki/File_Transfer_Protocol)*

### C'est quoi NGINX ?
NGINX est un server web. **(a preciser)**
</br>*[source](https://en.wikipedia.org/wiki/Nginx)*

### C'est quoi WordPress ?
Permet de creer le site de A a Z. **(a preciser)**
</br>*[source](https://fr.wikipedia.org/wiki/WordPress)*

### C'est quoi php-fpm ?
  
### C'est quoi MariaDB ?

### C'est quoi docker-network ?

### C'est quoi hacky-patch ?

### C'est quoi des Dockerfiles ?

### C'est quoi le PID1 ?
  
</details>

## Pourquoi ?
<details><summary>Utilité de choses faites dans le projet</summary>

### Pourquoi faire un container par processus ?
  
### Pourquoi ne pas utiliser un container comme une VM ?
  Attention un container n'est pas une VM. Ils doivent etres utiliser diffremment.
  Par exemple si vous voulez faire une update dans le container et que executer simplement la commande d'update dans celui-ci l'image du container sera toujours sur l'ancienne version
  
</details>


## À implémenter
* [ ] Un container Docker contenant NGINX avec TLSv1.2 ou TLSv1.3 uniquement.
* [ ] Un container Docker contenant WordPress + php-fpm (installé et configuré) uniquement sans nginx.
* [ ] Un container Docker contenant MariaDB uniquement sans nginx.
* [ ] Un volume contenant votre base de données WordPress.
* [ ] Un second volume contenant les fichiers de votre site WordPress.
* [ ] Un docker-network qui fera le lien entre vos containers.
