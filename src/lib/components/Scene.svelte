<script lang="ts">
  import { T, useTask } from "@threlte/core";
  import { OrbitControls, Grid, interactivity } from "@threlte/extras";
  import { DEG2RAD } from "three/src/math/MathUtils.js";

  import Nix from "./models/Nix.svelte";

  interactivity();

  let rotation = [90 * DEG2RAD, 0, 0];
  let hovered = false;

  useTask((delta) => {
    if (hovered) return;
    rotation[0] += delta * 90 * DEG2RAD;
  });
</script>

<Grid cellColor="#ffffff" sectionColor="#ffffff" fadeDistance={25} />

<T.DirectionalLight intensity={0.8} position.x={5} position.y={10} />
<T.AmbientLight intensity={0.2} />

<T.PerspectiveCamera
  makeDefault
  position.y={1}
  position.z={5}
  fov={95}
  on:create={({ ref }) => ref.lookAt(0, 1, 5)}
>
  <OrbitControls enableDamping target.y={1} />
</T.PerspectiveCamera>

<Nix
  scale={20}
  mater
  {rotation}
  on:pointerenter={() => {
    rotation = [90 * DEG2RAD, 0, 0];
    hovered = true;
  }}
  on:pointerleave={() => (hovered = false)}
/>
