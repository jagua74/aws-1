# Cloud9에 Terraform 설치 (Tokyo)
curl -O https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip
sudo unzip terraform_0.11.3_linux_amd64.zip -d /usr/local/bin
sudo yum -y update
sudo yum -y install aws-cli
terraform --version

# Key Pair 생성 (Seoul) 
# Cloud9 에서 사설 키 (skcc1-key.pem) 불러오기
chmod 0400 user02-key.pem

# 공개키 생성 (user02-key.pub)
ssh-keygen -y -f user02-key.pem >> user02-key.pub

# terraform 실행
terraform init
terraform plan
terraform apply

========================================================================================
# 인스턴스 접속 확인 
ssh -i user02-key ubuntu@13.112.24.105

# Web 서버 설치 
# setup.sh 생성 (vi로 파일 생성 후 setup.sh 내용 복사) 및 권한 부여 
vi setup.sh
chmod +x setup.sh

# setup.sh root 권한으로 실행 #####
sudo ./setup.sh

# 배포된 http 접속하기 (브라우저를 열어 publid-ip로 접속) 
http://13.112.24.105

# 이미지 생성 후 인스턴스 추가 user02-public-vm2 / ap-northeast-1d

========================================================================================
# 로드밸런스
대상그룹 등록 : 인스턴스 2개 등록

# AWS & Azure 연결 (Traffic Manager)
# Traffic Manager 엔드포인트 추가
azure vm 의 public dns 정보를 Aure 엔드포인트 중 공용 IP 주소로 추가한다. 가중치는 10으로 둔다.
aws vm 의 public dns 정보를 외부 엔드포인트 로 추가한다. 가중치는 5로 둔다.

# 결과
traffic manager dns 정보로 브라우저 접속시 AZURE 고양이를 볼 수 있음.

# 엔드포인트 서비스 내리기
azure vm 에서 아파치 서비스를 내려 보다. -> 결과는 AWS 고양이를 볼 수 있음.
다시 azure vm 에서 아파치 서비스를 올린다. -> 일정 시간 뒤에 다시 AZURE 고양이를 볼 수 있음.

# To stop Apache 2 web server
$ sudo /etc/init.d/apache2 stop

# To start Apache 2 web server
$ sudo /etc/init.d/apache2 start

# terraform 종료
terraform destroy
