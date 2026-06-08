# ICMP-Reflexive-DDoS
## 🕵️‍♂️ El bypass de mitigaciones DDoS: Cómo los atacantes esquivan a los gigantes (y cómo los frenamos en LINKEAR)

Muchos creen que contratar un servicio de mitigación premium en el core de la red (como Voxility o Computize) es suficiente para dormir tranquilos. Sin embargo, los atacantes avanzados no se detienen ahí. Cuando se topan con un muro volumétrico, cambian de estrategia y buscan las "puertas traseras" de la infraestructura.

Hoy quiero contarles cómo funciona una de las tácticas de bypass de mitigación más comunes y peligrosas en la arquitectura de red actual, y cómo la resolvimos de raíz.

### 👀 El Contexto: El arte de saltarse la mitigación

Cuando una red está bajo protección, el tráfico que llega por los tránsitos internacionales (los *carriers*) pasa por un proceso de limpieza. Pero, ¿qué pasa con las conexiones locales? Aquí es donde el atacante hace su tarea de reconocimiento:

1. **Mapeo de ASN e IXPs:** El atacante analiza la tabla BGP para identificar qué Sistemas Autónomos (ASNs) tienen conexión directa con la víctima y a qué Puntos de Intercambio de Tráfico (IXPs) está conectada.
2. **Escaneo de Infraestructura:** Escanean sistemáticamente esos proveedores locales buscando direcciones IPs y servicios que respondan de forma activa a solicitudes comunes: `PING (ICMP)`, `SYN (TCP)`, servidores `DNS`, `NTP`, `Game Servers`, etc.
3. **El Ataque por Vía Local:** Una vez recolectada una lista voluminosa de IPs vivas que tienen acceso directo a la víctima sin pasar por el mitigador central, el atacante hace *IP Spoofing*. Envía paquetes forjados simulando ser la víctima hacia esa lista de servidores locales. 

¿El resultado? La gigantesca respuesta de esos servidores va directo a la víctima a través de la red local (el IXP). Como ese tráfico viaja localmente, **esquiva por completo las defensas del mitigador central**, colapsando la infraestructura desde adentro.

### 👌 El Despliegue en el Borde: Zeus Firewall en acción

En **LINKEAR** entendemos que la seguridad debe ser holística y no depender de un solo punto de control. Nuestra red cuenta con la excelente protección de Computize para el tráfico general, pero sabíamos que debíamos blindar las interconexiones locales.

Para solucionar este vector de bypass de forma definitiva, desplegamos nuestro **Zeus Firewall** directamente en el borde de nuestra conexión con el IXP (CABASE) y en cada uno de nuestros *peers*.

### 🎩 La Lógica de Mitigación y Responsabilidad de Red

La estrategia con Zeus se enfocó en dos pilares fundamentales:

* **Inspección de Flujos en el IXP:** Zeus monitorea constantemente el tráfico entrante desde el IXP. Si detecta respuestas volumétricas o flujos no solicitados (como ráfagas de DNS, NTP o ICMP reflejados) que intentan ingresar directamente aprovechando la cercanía de la red, los descarta en el acto en la misma frontera, impidiendo que afecten los routers internos.
* **Ciudadanía Digital (Bloqueo de ICMP):** En seguridad, tu red no solo debe estar protegida, sino que no debe ser utilizada como vector para dañar a otros. Bloqueamos de forma estricta el tráfico ICMP saliente no controlado en nuestra infraestructura para evitar que nuestras IPs sean escaneadas y utilizadas en listas de amplificación contra terceros.

### 🤓 Conclusión de la Resiliencia

> Gracias a la combinación estratégica de **Computize** en el core y **Zeus Firewall** en el borde absoluto del IXP y los peers, logramos anular por completo los intentos de bypass por redes locales. El tráfico malicioso es interceptado de manera inteligente según su procedencia, garantizando la estabilidad absoluta de la red y protegiendo al ecosistema.

---

Este caso nos demuestra que la mitigación en la nube o en tránsitos internacionales es solo la mitad de la ecuación. Si tu ISP o empresa está conectada a un IXP, necesitas visibilidad y capacidad de cómputo en el borde local para evitar que los ataques entren por el camino más corto.

¿Tu red cuenta con protección específica en el borde de sus IXPs y peers para evitar que esquiven tus mitigadores?

Si querés elevar el nivel de seguridad de tu infraestructura de red o conocer más sobre cómo implementamos Zeus Firewall para proteger enlaces locales, escribinos a **hola@waugi.com** o contactanos por mensaje privado.
