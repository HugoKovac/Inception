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

### C'est quoi un Docker Compose ?
</br>*[source](https://docs.docker.com/compose/)*

### C'est quoi TLS ?

### C'est quoi NGINX ?

### C'est quoi WordPress ?

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
