const int tempPin = A2;



void setup() {
  Serial.begin(9600);
}

void loop() {
  delay(500);
  float temp = analogRead(tempPin);
  Serial.print("$");  // start char
  Serial.print("tmp");
  Serial.println(temp);
  Serial.print(";^\n"); // end char
}
