# Erldemo
An Erlang driven demoscene thingy

### Build
```rebar3 compile```

### Run
```rebar3 shell```

See it in action on ```localhost:8080```


### Features

- 3D raymarching scene with 3 spheres

- Rotation controlled by Erlang (rotX, rotY)
  - Erlang sends time + parameters = clock + control system

- Smooth animation using JS interpolation

- GPU renders everything — no CPU bottleneck

- WebSocket controls parameters in real time
