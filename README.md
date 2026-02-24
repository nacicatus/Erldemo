# Erldemo
An Erlang driven demoscene thingy

### Build
```rebar3 compile```

### Run
```rebar3 shell```

See it in action on ```localhost:8080```
<img width="900" height="495" alt="Screenshot 2026-02-24 at 19 02 48" src="https://github.com/user-attachments/assets/88146aa7-38b5-4010-b61f-47339c5f22a3" />

### Features

- 3D raymarching scene with 3 spheres

- Rotation controlled by Erlang (rotX, rotY)
  - Erlang sends time + parameters = clock + control system

- Smooth animation using JS interpolation

- GPU renders everything — no CPU bottleneck

- WebSocket controls parameters in real time
