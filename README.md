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
NGINX est un server HTTP, qui peut supporter beaucoup plus trafic simultanée que Apache par exemple.
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
Le pid1 est le processus sur la machine qui porte le numero 1. Il a certaine particularitee : 
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
* [ ] Un container Docker contenant NGINX avec TLSv1.2 ou TLSv1.3 uniquement.
* [ ] Un container Docker contenant WordPress + php-fpm (installé et configuré) uniquement sans nginx.
* [ ] Un container Docker contenant MariaDB uniquement sans nginx.
* [ ] Un volume contenant votre base de données WordPress.
* [ ] Un second volume contenant les fichiers de votre site WordPress.
* [ ] Un docker-network qui fera le lien entre vos containers.

## Créer le Docker file de NGINX et TLS
<!-- <details><summary></summary> -->

</br>

C'est facultatif mais il est bien de mettre un moyen d'etre contacte dans dans les meta-donnees du container grace a container.

`LABEL maintainer=name<mail@domain>`

* [Apprendre a faire un Dockerfile](https://putaindecode.io/articles/les-dockerfiles/)</br>
* [DockerFile best practices Doc](https://docs.docker.com/get-started/09_image_best/)</br>
* [DockerFile for NGINX Doc](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-docker/)</br>
* [DockerFile Doc (keywords)](https://docs.docker.com/engine/reference/builder/)</br>

<!-- </details> -->


## Resources tmp
* https://www.youtube.com/watch?v=1P54UoBjbDs - Install php-fpm on ubuntu
* https://www.youtube.com/watch?v=I_9-xWmkh28 - install nginx and php-fpm and explain why different containers
