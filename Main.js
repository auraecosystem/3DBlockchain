import * as THREE from "https://cdn.jsdelivr.net/npm/three@0.160.0/build/three.module.js";

const scene = new THREE.Scene();
scene.fog = new THREE.Fog(0x000000, 60, 200);

// Camera
const camera = new THREE.PerspectiveCamera(
  75,
  window.innerWidth / window.innerHeight,
  0.1,
  1000
);
camera.position.z = 120;

// Renderer (IMPORTANT: enable bloom-ready output feel)
const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(window.innerWidth, window.innerHeight);
renderer.setPixelRatio(window.devicePixelRatio);
document.body.appendChild(renderer.domElement);

// 🔥 LIGHT SYSTEM (this creates the glow illusion)
const light = new THREE.PointLight(0x00ffcc, 2.5, 300);
light.position.set(50, 50, 50);
scene.add(light);

const light2 = new THREE.PointLight(0xff00ff, 1.8, 300);
light2.position.set(-50, -30, 40);
scene.add(light2);

// 🌐 CORE (EMISSIVE GLOW MATERIAL)
const core = new THREE.Mesh(
  new THREE.SphereGeometry(18, 64, 64),
  new THREE.MeshStandardMaterial({
    color: 0x001a1a,
    emissive: 0x00ffcc,
    emissiveIntensity: 2.2,
    metalness: 0.4,
    roughness: 0.2
  })
);
scene.add(core);

// 💍 ENERGY RING
const ring = new THREE.Mesh(
  new THREE.TorusGeometry(42, 1.2, 16, 200),
  new THREE.MeshStandardMaterial({
    color: 0x0a0a0a,
    emissive: 0xff00ff,
    emissiveIntensity: 2,
    metalness: 0.6,
    roughness: 0.3
  })
);
scene.add(ring);

// ⚡ OUTER PULSE RING
const ring2 = new THREE.Mesh(
  new THREE.TorusGeometry(55, 0.6, 16, 200),
  new THREE.MeshStandardMaterial({
    color: 0x000000,
    emissive: 0x00ffff,
    emissiveIntensity: 1.5
  })
);
scene.add(ring2);

// 🌌 GLOW PULSE FUNCTION
let t = 0;

function animate() {
  requestAnimationFrame(animate);
  t += 0.02;

  // core motion
  core.rotation.y += 0.01;
  core.scale.setScalar(1 + Math.sin(t) * 0.05);

  // ring motion
  ring.rotation.x += 0.005;
  ring.rotation.z += 0.002;

  ring2.rotation.y -= 0.003;

  // pulsing light intensity
  light.intensity = 2 + Math.sin(t) * 0.8;
  light2.intensity = 1.5 + Math.cos(t) * 0.6;

  renderer.render(scene, camera);
}

animate();

// resize
window.addEventListener("resize", () => {
  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();
  renderer.setSize(window.innerWidth, window.innerHeight);
});
