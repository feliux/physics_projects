import pygame
import numpy as np
import time

# Reglas ab/c => 
#23/3 => Conway
#24/3 => crece, laberinto
a, b, c = 2, 4, 3
pygame.init()

# Tablero
width, height = 700, 700
screen = pygame.display.set_mode((width, height))
pygame.display.set_caption('Game of Life')

# Pintamos fondo
white = (255, 255, 255)
gray = (128, 128, 128)
bg = (25, 25, 25)
screen.fill(bg)

# Numero de celdas y dimensiones de cada celda
nxC, nyC = 100, 100
dimCW = width / nxC
dimCH = height / nyC

# Estado inicial
#gameState = np.random.choice([1, 0], (nxC, nyC))
gameState = np.zeros((nxC, nyC))
# Palo
#gameState[50, 49] = 1
#gameState[50, 50] = 1
#gameState[50, 51] = 1

pause = False
it = 0
p = 0

while True:

    new_gameState = np.copy(gameState)
    screen.fill(bg)
    #time.sleep(0.01)
    
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
    
    for y in range(0, nxC):
        for x in range(0, nyC):
            
            if not pause:
                # Vecinos cercanos (con condiciones de contorno toroidal)
                n_neigh = gameState[(x-1) % nxC, (y-1) % nyC] + \
                          gameState[(x) % nxC, (y-1) % nyC] + \
                          gameState[(x+1) % nxC, (y-1) % nyC] + \
                          gameState[(x-1) % nxC, (y) % nyC] + \
                          gameState[(x+1) % nxC, (y) % nyC] + \
                          gameState[(x-1) % nxC, (y+1) % nyC] + \
                          gameState[(x) % nxC, (y+1) % nyC] + \
                          gameState[(x+1) % nxC, (y+1) % nyC]
                          
                # Rules
                if gameState[x, y] == 0 and n_neigh == c :
                    new_gameState[x, y] = 1
                elif gameState[x, y] == 1 and (n_neigh < a or n_neigh > b):
                    new_gameState[x , y] = 0
                    
            # Poligono de cada celda a dibujar
            poly = [((x) * dimCW, y * dimCH),
                    ((x+1) * dimCW, y * dimCH),
                    ((x+1) * dimCW, (y+1) * dimCH),
                    ((x) * dimCW, (y+1) * dimCH)]
                        
            # Dibujamos la celda para cada par x, y
            if new_gameState[x, y] == 0:
                pygame.draw.polygon(screen, gray, poly, 1)
            else:
                pygame.draw.polygon(screen, white, poly, 0)
                
    # Actualizamos estado del tablero
    gameState = np.copy(new_gameState)
    
    if not pause:
        it += 1
        print("Iteración: ", it)
    pygame.display.update()
