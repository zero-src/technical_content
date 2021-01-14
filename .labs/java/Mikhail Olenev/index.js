const token = `f03b04b18c9c0743cd27b4c697e8a875f8a681adf84e7db3db4229a0275c1e51bef953fdebfa00b9f8ed8`;

function bytesToHex(bytes) {
  return Array.from(
    bytes,
    byte => byte.toString(16).padStart(2, "0")
  ).join("");
}

function hexToBytes(hex) {
  const bytes = new Uint8Array(hex.length / 2);
  for (let i = 0; i !== bytes.length; i++) {
      bytes[i] = parseInt(hex.substr(i * 2, 2), 16);
  }
  return bytes;
}

function tohex(string) {
  return bytesToHex(new TextEncoder().encode(string));
}

function fromhex(string) {
  return new TextDecoder().decode(hexToBytes(string));
}
let hexed = tohex(token)
alert(hexed);