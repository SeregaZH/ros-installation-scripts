FROM ros:melodic-ros-base

WORKDIR .
COPY . .

RUN apt-get update && apt-get install ros-melodic-rosbridge-suite -y

EXPOSE 9090
EXPOSE 11311

CMD ["roscore"]