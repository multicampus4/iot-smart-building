#  AWS EC2 접속하기 (Windows)

## 1. putty 설치

https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.74-installer.msi 

## 2. 인스턴스 연결

https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/putty.html

## 3. 접속정보

* Host Name : ec2-00-000-000-000.ap-northeast-2.compute.amazonaws.com
* 키파일(.ppk) : https://drive.google.com/file/d/0000Jq00000P3l000oZC000QHSjXQF8/000?usp=sharing
* login as : ec2-user



# Main Server 배포 & 실행

1. Eclipse에서 JAR Export

   * 외부 라이브러리 포함하기 위해 Runnable JAR 로 Export

2. FTP 업로드

   * `Server.jar` : ec-user/home 내 아무 폴더 생성하여 업로드 
   * `log4j.protperties` : `Server.jar` 와 동일 폴더에 업로드
   * `my.properties` : `Server.jar` 가 있는 폴더의 한 단계 상위 폴더에 업로드

3. 적절한 my.properties 설정

4. Server.jar 가 있는 폴더로 이동하여 아래 명령어로 서버 실행

   ```bash
   java -jar Server.jar
   ```



# Spring Boot 배포 & 실행

1. 메인서버 실행이 선행되어야 함

2. root 유저로 변경

   ```bash
   sudo su
   ```

3. github에서 레포지토리 pull

   ```bash
   git pull origin master
   ```

4. my.properties  설정

5. Spring 프로젝트 폴더로 이동

6. 폴더에 mvnw 있는지 확인

   ```bash
   ls
   ```

7. 아래 코드 실행하여 war 파일 생성

   ```bash
   ./mvnw clean package
   ```

   *  권한 부족할 경우 실행권한 부여

   ```bash
   sudo chmod +x mvnw
   ```

8. target 폴더에 `.war` 파일 생성되었는지 확인

9. `.war` 파일을 `tartget` 폴더의 한 단계 상위 폴더로 이동

   ```bash
   mv target/~~.war ./
   ```

10. `.war` 실행

    ```bash
    java -jar ~~.war
    ```



# HIVE 실행

1. root user로 변경

   ```bash
   sudo su
   ```

2. root 폴더로 이동

   ```bash
   cd
   ```

3. 환경변수 적용

   ```bash
   source /etc/profile
   ```

4. HIVE실행

   ```bash
   start-all.sh
   ```

5. 노드, 트래커 로드

   ```bash
   jps
   ```

6. 노드의 정상 로드 확인 (6개)

   * TaskTracker
   * DataNode
   * Namenode
   * JobTracker
   * SecondaryNameNode

7. hive 실행

   > start-all 하고서 너무 빨리 hive 하면 에러가 납니다. 에러가 났다면 조금 기다렸다 다시 hive 하시면 됩니다

   ```bash
   hive
   ```

   * Spring Controller 연동 시 아래 명령어 실행

     ```bash
      hive --service hiveserver2
     ```



# AWS RDS Oracle DB에 SQL Developer로 접속

* id : admin

* pw : 000000000

* host : database-1.chookpxses6b.ap-northeast-2.rds.amazonaws.com

* port : 1521

* SID : ORCL

  ![image](md-images\image.png)

# old) Tomcat에 WAR 배포하기 

## 1. Eclipse 에서 WAR Export

## 2. FTP 업로드

* FileZilla 접속

* 아래 경로에 war 파일 업로드

  ```bash
  /usr/local/tomcat9.0/webapps
  ```

  