# Erldemo
An Erlang driven demoscene thingy

### Build
```rebar3 compile```

### Run
```rebar3 shell```

See it in action on ```localhost:8080```

<img width="843" height="734" alt="Screenshot 2026-02-24 at 19 53 28" src="https://github.com/user-attachments/assets/ee43c28a-573b-48fe-b68c-65f149c7c939" />

### Features

- 3D raymarching scene with 2 spheres with sound effects. Move away to another tab and it complains!

- Rotation controlled by Erlang (rotX, rotY)
  - Erlang sends time + parameters = clock + control system

- Smooth animation using JS interpolation

- GPU renders everything — no CPU bottleneck

- WebSocket controls parameters in real time
