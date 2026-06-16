#include <WiFi.h>

void setup() {
  Serial.begin(115200);

  // boot identity core
  loadIdentity();

  // connect to KMS server
  connectToKMS();

  // start LED status system
  initLED();
}

void loop() {
  if (hasTransaction()) {
    signTransaction();
    broadcastToNetwork();
    blinkLED("green");
  }

  delay(1000);
}
