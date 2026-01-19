--!strict

export type TextStyle = {} -- TODO

export type ThemeColor = "Default" | "Blue" | "Red" | "Green" | "Yellow" | "Purple" | "Orange" | "Pink" | "Grey"

export type Header = {
    Type: "Header",
    Text: string,
    Style: TextStyle?
}

export type RichText = {
    Type: "RichText",
    Text: string,
    Style: TextStyle?
}

export type ListLayout = {
    Type: "ListLayout",
    HorizontalAlignment: "Left" | "Center" | "Right",
    VerticalAlignment: "Top" | "Middle" | "Bottom",
    Wraps: boolean?,
    Padding: number?
}

export type GridAligner = {
    Type: "Aligner",
    Rows: number,
    Columns: number,
    Width: number,
    Height: number,
    Padding: number
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
    
    Width: number?,
    Height: number?,
    
    TextStyle: TextStyle?,
    Color: string,

    ButtonColor: ThemeColor?,
}

export type ImageButton = {
    Type: "ImageButton",
    ImageAssetId: string,
    OnClick: () -> ()?,
    
    Width: number?,
    Height: number?,

    ButtonColor: ThemeColor?,
}

export type Image = {
    Type: "Image",
    ImageAssetId: string,
    
    Width: number?,
    Height: number?,
}

export type FillFrame = {
    Type: "FillFrame",

    BackgroundColor: ThemeColor?,
    Transparency: number?,
    
    Content: {GuidebookContent},
}

export type Frame = {
    Type: "Frame",
    Width: number?,
    Height: number?,

    BackgroundColor: ThemeColor?,
    Transparency: number?,
    
    Content: {GuidebookContent},
}

export type GuidebookContent = Header | RichText | ListLayout | GridAligner | Table | Button | ImageButton | Image | Frame | FillFrame

export type GuidebookPage = {
    Title: string,
    Content: {GuidebookContent},
}

return {}