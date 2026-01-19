--!strict

export type Stroke = {
    Color: Color3,
    Thickness: number,
    Transparency: number?,
}

export type TextStyle = {
    FontSize: number?,
    FontWeight: Enum.FontWeight?,
    FontStroke: Stroke?,
    
    XAlignment: Enum.TextXAlignment?,
    YAlignment: Enum.TextYAlignment?,
} -- TODO

export type ThemeColor = "Default" | "Blue" | "Red" | "Green" | "Yellow" | "Purple" | "Orange" | "Pink" | "Grey"

export type RichText = {
    Type: "RichText",
    Text: string,
    Style: TextStyle?,

    ZIndex: number?,

    Size: UDim2?,
    Position: UDim2?,
    AnchorPoint: Vector2?,
}

export type ListLayout = {
    Type: "ListLayout",
    HorizontalAlignment: "Left" | "Center" | "Right",
    VerticalAlignment: "Top" | "Middle" | "Bottom",
    Wraps: boolean?,
    Padding: number?
}

export type GridLayout = {
    Type: "GridLayout",
    
    Width: number,
    Height: number,

    Padding: number?,

    HorizontalAlignment: "Left" | "Center" | "Right",
    VerticalAlignment: "Top" | "Middle" | "Bottom",

    FillDirection: ("Horizontal" | "Vertical")?,
    MaxCellsPerLine: number?,
}

export type Table = {
    Type: "Table",
    Headers: {string},
    Rows: {{string}},
}

export type Button = {
    Type: "Button",
    Text: string,
    IconAssetId: string?,

    OnClick: () -> ()?,
    
    Size: UDim2?,
    Position: UDim2?,
    
    TextStyle: TextStyle?,
    Color: string,

    ButtonColor: ThemeColor?,

    ZIndex: number?,
}

export type GenericButton = {
    Type: "GenericButton",

    Text: string,
    TextStyle: TextStyle?,

    OnClick: () -> ()?,
    
    Size: UDim2?,
    Position: UDim2?,
    AnchorPoint: Vector2?,
    AutomaticSize: Enum.AutomaticSize?,
    
    BackgroundColor: ThemeColor?,
    Transparency: number?,

    ZIndex: number?,
}

export type ImageButton = {
    Type: "ImageButton",
    ImageAssetId: string,
    OnClick: () -> ()?,
    
    Size: UDim2?,
    Position: UDim2?,

    ButtonColor: ThemeColor?,

    ZIndex: number?,
}

export type Image = {
    Type: "Image",
    ImageAssetId: string,
    
    Size: UDim2?,
    Position: UDim2?,
    AnchorPoint: Vector2?,

    ZIndex: number?,
}

export type Frame = {
    Type: "Frame",

    Size: UDim2?,
    Position: UDim2?,
    AnchorPoint: Vector2?,
    AutomaticSize: Enum.AutomaticSize?,

    BackgroundColor: ThemeColor?,
    Transparency: number?,

    ZIndex: number?,
    
    Content: {GuidebookContent},
}

export type ScrollingFrame = Frame & {
    Type: "ScrollingFrame",

    CanvasSize: UDim2?,
    ScrollBarThickness: number?,
    AutomaticCanvasSize: Enum.AutomaticSize?
}

export type GuidebookContent = RichText | ListLayout | GridLayout | Table | Button | ImageButton | Image | Frame | ScrollingFrame | GenericButton

export type GuidebookPage = {
    Title: string,
    Content: {GuidebookContent},
}

return {}