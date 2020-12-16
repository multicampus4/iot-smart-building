int pin = A1;
unsigned long duration;
unsigned long starttime;
unsigned long sampletime_ms = 30000;
unsigned long lowpulseoccupancy = 0;
float ratio = 0;
float concentration = 0;
float ugm3 = 0;

void setup() {
  Serial.begin(9600);
  pinMode(pin,INPUT);
  starttime = millis();
}

void loop() {
  duration = pulseIn(pin, LOW);
  lowpulseoccupancy = lowpulseoccupancy+duration;

  if ((millis()-starttime) > sampletime_ms)
  {
    ratio = lowpulseoccupancy/(sampletime_ms*10.0);  // Integer percentage 0=>100
    concentration = 1.1*pow(ratio,3)-3.8*pow(ratio,2)+520*ratio+0.62; // using spec sheet curve
    ugm3= concentration * 100 /13000;
    
    Serial.print("$");  // start char
    Serial.print("ugm3 = " );
    Serial.print(ugm3);
    Serial.print("ug/m3" );
    Serial.print(";^\n"); // end char
    //Serial.print(ratio); Low pulse Occupancy %를 알고 싶을때
    //Serial.print(concentration); concentration 를 알고 싶을때
    lowpulseoccupancy = 0;
    starttime = millis();
  }
}