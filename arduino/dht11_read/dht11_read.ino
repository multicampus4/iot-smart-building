#include <DHT11.h>
int pin=A0;
DHT11 dht11(pin); 
void setup()
{
   Serial.begin(9600);
}

void loop()
{
  int err;
  float temp, humi;
  if((err=dht11.read(humi, temp))==0)
  {
    Serial.print("$");  // start char
    Serial.print("tmp:");
    Serial.print(temp);
    Serial.print(";hum:");
    Serial.print(humi,0);
    Serial.print(";^\n"); // end char
  }
  else
  {
    Serial.print("$");  // start char
    Serial.println();
    Serial.print("Error No :");
    Serial.print(err);
    Serial.print(";^\n"); // end char
  }
  delay(1200); //delay for reread
}



