extends Node


const transform_matrix: Transform2D = Transform2D(Vector2(1/sqrt(2),0.5), Vector2(-1/sqrt(2),0.5), Vector2(0,0))
#const transform_matrix: Transform2D = Transform2D(Vector2(1,0), Vector2(0,1/sqrt(2)), Vector2(0,0)) * Transform2D(PI / 4, Vector2(0,0))
const inverse_transform_matrix: Transform2D = Transform2D(Vector2(sqrt(2)/2,-sqrt(2)/2), Vector2(1,1), Vector2(0,0))



enum DoorOrientation { LEFT, RIGHT }
