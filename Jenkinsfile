pipeline {
    agent any

    environment {
        // Fix PATH cho macOS để nhận lệnh docker
        PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${env.PATH}"
        IMAGE_NAME = "my-html-web"
        CONTAINER_NAME = "html-server-container"
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Clone code từ GitHub của bạn
                git branch: 'main', url: 'https://github.com/MrSoon/testjenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build image từ Dockerfile trong repo
                    sh "docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    // Dọn dẹp container cũ nếu đang chạy
                    sh "docker stop ${CONTAINER_NAME} || true"
                    sh "docker rm ${CONTAINER_NAME} || true"
                    
                    // Chạy container mới trên cổng 8081 (hoặc cổng bạn muốn)
                    sh "docker run -d --name ${CONTAINER_NAME} -p 8081:80 ${IMAGE_NAME}:latest"
                }
            }
        }
    }

    post {
        success {
            echo "Website đã sẵn sàng tại http://localhost:8081"
        }
        always {
            // Xóa các image thừa để tiết kiệm ổ cứng máy Mac
            sh "docker image prune -f"
        }
    }
}