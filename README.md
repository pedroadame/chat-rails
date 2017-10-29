# Aplicacion de Chat en tiempo real

Para poner en marcha la aplicacion, hacer falta tener instalado Docker y Docker Compose.

1. Clonar el proyecto
2. Ejecutar `docker-compose build`
3. Ejecutar `docker-compose run web bundle install`
4. Ejecutar `docker-compose run web yarn install`
5. Ejecutar `docker-compose run web bundle exec rails db:create`
6. Ejecutar `docker-compose run web bundle exec rails db:schema:load`
7. Ejecutar `docker-compose up`. Entrar en `http://localhost:3000`
8. (Opcional) Ejecutar tests con `docker-compose run tests bundle exec rspec`
