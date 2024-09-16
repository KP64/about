<script lang="ts">
  import { T } from "@threlte/core";
  import { ContactShadows, Float, Grid, OrbitControls } from "@threlte/extras";
  import Nix from "./models/Nix.svelte";
  import Typescript from "./models/Typescript.svelte";
  import Threlte from "./models/threlte.svelte";
</script>

<T.PerspectiveCamera makeDefault position={[-10, 10, 10]} fov={15}>
  <OrbitControls enableZoom={true} enableDamping target.y={1.5} />
</T.PerspectiveCamera>

<T.DirectionalLight intensity={0.8} position.x={5} position.y={10} />
<T.AmbientLight intensity={0.2} />

<Grid
  position.y={-0.001}
  cellColor="#ffffff"
  sectionColor="#ffffff"
  sectionThickness={0}
  fadeDistance={25}
  cellSize={2}
/>

<Float floatIntensity={1} floatingRange={[0, 1]}>
  <Nix scale={20} rotation={[45, 0, 0]} position={[1, 0, -3]} />
</Float>

<Float floatIntensity={1} floatingRange={[0, 1]}>
  <Typescript scale={20} />
</Float>

<Threlte scale={0.5} position={[3, 0, -3]} rotation={[0, 90, 0]} />

<ContactShadows scale={10} blur={2} far={2.5} opacity={0.5} />
