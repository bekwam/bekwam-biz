# bekwam-biz
Demonstration of a containerized static site generated from markdown

## Some commands to support this

Build the image

    docker build -t bekwam-biz:latest .
    
Run the site as static content under NGNIX.  This exposes port 80 from the container.  The -d option runs it as a detached process.  --name is a tag that can be used to refer to this as "bb" in commands instead of the random strings (ex "happy_penguin").  The --rm option means that the container will be removed when it is stopped.

    docker container run -d --rm --name bb -p 80:80 bekwam-biz:latest
    
Stop the server.  This will delete the container since --rm was specified in the run command.  Otherwise, manually delete with `docker container rm`.

    docker container stop bb
