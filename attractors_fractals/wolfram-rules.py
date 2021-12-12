import pygame
import numpy as np
import time

pygame.init()

# Wolfram rules
rule = int(input("Escriba la regla a dibujar y presione ENTER (0 - 255): "))
rules = list(np.binary_repr(rule, width=8))
rules.reverse()
print("Regla: ", rule, rules)

# Tablero
width, height = 600, 600
screen = pygame.display.set_mode((width, height))
pygame.display.set_caption('Wolfram Rules')

# Pintamos fondo
white = (255, 255, 255)
gray = (128, 128, 128)
bg = (25, 25, 25)
screen.fill(bg)

# Numero de celdas y dimensiones de cada celda
nxC, nyC = 200, 200
dimCW = width / nxC
dimCH = height / nyC

# Estado inicial
gameState = np.zeros((nxC, nyC))
gameState[int(nxC / 2), 0] = 1


# Tablero inicial
for y in range(0, nxC):
    for x in range(0, nyC):
    
        # Poligono de cada celda a dibujar
        poly = [((x) * dimCW, y * dimCH),
                ((x+1) * dimCW, y * dimCH),
                ((x+1) * dimCW, (y+1) * dimCH),
                ((x) * dimCW, (y+1) * dimCH)]
                
        pygame.draw.polygon(screen, gray, poly, 1)

pause = False
it = 0
y = 0

while y < nyC:

    new_gameState = np.copy(gameState)
    time.sleep(0.01)
    
    # Interaccion keyboard (pause) y mouse (pintar)
    ev = pygame.event.get()
    for event in ev:
        if event.type == pygame.KEYDOWN:
            pause = not pause
            
        mouseClick = pygame.mouse.get_pressed()
        #print(mouseClick)
        if sum(mouseClick) > 0:
            posX, posY = pygame.mouse.get_pos()
            celX, celY = int(np.floor(posX / dimCW)), int(np.floor(posY / dimCH))
            new_gameState[celX, celY] = not mouseClick[2]
    
    for x in range(0, nxC):
        
        if not pause:
            # Logica de reglas
            ruleIdx = 4 * gameState[(x - 1) % nxC, y] + 2 * gameState[(x, y)] + 1 * gameState[(x + 1) % nxC, y]
            
            new_gameState[x, (y + 1) % nyC] = rules[int(ruleIdx)]
            
        # Poligono de cada celda a dibujar
        poly = [((x) * dimCW, y * dimCH),
                ((x+1) * dimCW, y * dimCH),
                ((x+1) * dimCW, (y+1) * dimCH),
                ((x) * dimCW, (y+1) * dimCH)]
                
        # Dibujamos la celda para cada par x, y
        if new_gameState[x, y] == 1:
            pygame.draw.polygon(screen, white, poly, 0)
                
    # Actualizamos estado del tablero
    gameState = np.copy(new_gameState)
    
    if not pause:
        y += 1
        it += 1
        z = y           # Para no repetir el print de pause en terminal indefinidamente...
        
    # Pause para no cerrar imagen al final del while
    if z == (nyC - 1):
        z = 0
        pause = True
        print("Presione cualquier tecla para terminar ejecución.")

    pygame.display.update()
    
print("Iteración: ", it)
