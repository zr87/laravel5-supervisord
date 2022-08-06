#laravel5-supervisord
Supervisor designed to run in a separate container versus running in same container as the main app.
This image is optimized to use it wit Laravel 5.2 and php version 7.1.

It has been structured in such way as to be used with `Docker Compose`. 
The `supervisord.conf` uses the following containers environment variables to start and manage Laravel queue workers:

* APP_ROOT: this is the root directory of your Laravel application inside the container (mount your local Laravel app directory to the container). Specifically, `artisan` must be located in this directory.
* QUEUE_DRIVER: this is the driver of your [Laravel queues](https://laravel.com/docs/7.x/queues#driver-prerequisites).
* OPTIONS: these are arguments sent to `php artisan queue:worker QUEUE_DRIVER`, e.g. `php artisan queue:worker database --sleep=3 --tries=3`.
* NUM_PROCS: this is the number of workers that `supervisord` must create to handle jobs.

In the repo you can find also an example `docker-compose.yml` with an example `.env` file.
