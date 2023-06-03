Para ejecutar terraform con la cuenta de servicio:

docker run -it --rm -w /app -v $(pwd):/app --env-file=.env --entrypoint sh hashicorp/terraform:1.3.0