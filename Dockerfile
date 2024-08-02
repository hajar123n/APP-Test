# Utiliser une version générique de l'image OpenJDK
FROM openjdk:21

# Définir le répertoire de travail
WORKDIR /AppMed

# Copier le fichier JAR de l'application dans le conteneur
COPY target/MVC_Test-0.0.1-SNAPSHOT.jar /AppMed/mon-projet.jar

# Définir l'auteur du Dockerfile
LABEL authors="Informatique"

# Utiliser ENTRYPOINT pour lancer l'application Java
ENTRYPOINT ["java", "-jar", "/AppMed/mon-projet.jar"]

