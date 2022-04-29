FROM mikefarah/yq:4
WORKDIR /app
COPY files .
RUN mkdir output
ENTRYPOINT ["sh"]
CMD ["run.sh"]