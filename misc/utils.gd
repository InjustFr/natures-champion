extends Node


const transform_matrix: Transform2D = Transform2D(Vector2(1/sqrt(2),0.5/sqrt(2)), Vector2(-1/sqrt(2),0.5/sqrt(2)), Vector2(0,0))
const inverse_transform_matrix: Transform2D = Transform2D(Vector2(sqrt(2)/2,-sqrt(2)/2), Vector2(sqrt(2),sqrt(2)), Vector2(0,0))


enum DoorOrientation { LEFT, RIGHT }
