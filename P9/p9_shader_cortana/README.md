# Practica 9 - Shaders

**Hecho por Borja Zarco Cerezo**

## Índice
- [Introducción](#introducción) 
- [Desarrollo](#desarrollo)
- [Uso](#uso)
- [Resultado](#resultado)
- [Referencias](#referencias)

## Introducción

El objetivo de esta práctica consiste en trabajar shaders de fragmentos para la creación de diseños generativos o el procesamiento de imágenes. 

## Desarrollo

Para el desarrollo de la práctica, se han desarrollado dos shaders. El primero consiste en una recreación del asistente de voz de Windows, comunmente conocido como Cortana. Para ello, se manda información al shader acerca de la resolución de la pantalla y el volumen que capta el micrófono.

```java
float volume = level.analyze() + 0.1;
sh.set("u_resolution", float(width), float(height));
sh.set("u_volume", volume);
```

Para cada píxel se comprobará si este se encuentra a una cierta distancia del centro de la aplicación. Esta distancia viene determinada por el volumen captado. Esta distancia determinará, así, el color que deberá adquirir cada pixel.

```glsl
pct = distance(st,vec2(0.5));

vec3 color = vec3(0.0);
if (pct < u_volume && pct > u_volume * 0.5) {
    color = vec3(0.047, 0.286, 0.404);
    if (pct < u_volume - 0.025) { 
        color = vec3(0.137, 0.607, 0.898);
    }
}	
```


## Referencias

* [Guion de prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/22/CIU_Pr_cticas.pdf)
* [GifAnimation](https://github.com/extrapixel/gif-animation)
* [Documentación Processing](https://processing.org/)
* [Documentación Shaders](https://thebookofshaders.com/)