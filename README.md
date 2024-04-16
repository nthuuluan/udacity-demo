Deployment Documentation
    This document serves as a guide for deploying changes to the project. It provides an overview of the technologies and tools used in the build and deployment process, as well as instructions for releasing new builds.

Technologies Used
    Kubernetes: Used for container orchestration and managing the deployment of microservices.
    Docker: Utilized for containerization of applications, allowing for consistent deployment across different environments.
    Helm: Used for managing Kubernetes applications and enabling easy installation, upgrade, and management of Kubernetes manifests.
    AWS (Amazon Web Services): Utilized for hosting infrastructure and resources, including Elastic Kubernetes Service (EKS) for running Kubernetes clusters.
    GitHub Repository: GitHub is used to store the project and serve as the source for AWS CodeBuild to build.

Deployment Process Overview

    Create EKS Cluster and Node Group:
        Utilize eksctl to create an EKS cluster and node group, providing scalability and reliability.
        Rationale: Establishing the EKS cluster and node group ensures a robust infrastructure for hosting microservices.
        
    Configure PostgreSQL Database:
        Configure the PostgreSQL database using the following YAML files:
            postgresql-deployment.yaml
            pv.yaml
            pvc.yaml
        Rationale: Proper configuration of the PostgreSQL database ensures reliable data storage for the application.

    Deploy PostgreSQL Service:
        Deploy the PostgreSQL service using the postgresql-service.yaml file.

    Push Project to GitHub Repository:
        Include Dockerfile and buildspec.yaml in the project.
        Push the project code to the GitHub repository.
        Rationale: Storing the project code on GitHub enables version control and facilitates integration with AWS CodeBuild.

    Create AWS Elastic Container Registry (ECR):
        Set up an ECR repository to store Docker images.
        Rationale: ECR provides a secure and scalable registry for storing Docker images, ensuring reliable deployment of containerized applications.

    Create and Configure CodeBuild:
        Link CodeBuild to the GitHub repository to automate the build process.
        Configure CodeBuild settings as needed.
        Rationale: Configuring CodeBuild automates the build process, enabling seamless integration of changes into the deployment pipeline.

    Start Build and Monitor Build Number:
        Initiate the build process in CodeBuild and monitor the build number for tracking.
        Rationale: Monitoring the build number ensures visibility into the progress of the build process and allows for timely resolution of any issues.

    Deploy Microservice-Coworking:
        Configure the deployment using the following YAML files:
            configmap.yaml
            secret.yaml
            coworking.yaml
        Rationale: Deploying the microservice ensures the availability of the application functionality.

    Check CloudWatch Cluster:
        Monitor the CloudWatch cluster for any logs or metrics related to the deployed microservice.
        Rationale: Monitoring the CloudWatch cluster provides insights into the health and performance of the deployed microservice.

    Check List of Services:
        Command: kubectl get svc
        Rationale: Checking the list of services ensures that the necessary services are running and accessible within the cluster.

    Check Pods:
        Command: kubectl get pods
        Rationale: Checking the status of pods verifies the availability and health of the deployed containers within the cluster.
