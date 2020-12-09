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
    Serial.print("tmp:");
    Serial.print(temp);
    Serial.print(";hum:");
    Serial.println(humi,0);
  }
  else
  {
    Serial.println();
    Serial.print("Error No :");
    Serial.println(err);
  }
  delay(1200); //delay for reread
}



