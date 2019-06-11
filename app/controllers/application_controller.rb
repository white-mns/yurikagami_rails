class ApplicationController < ActionController::Base
    def placeholder_set
        @placeholder = {}
        @placeholder["Number"] = "例）1~10/50~100"
        @placeholder["Text"]   = "例）武器/\"防具\""
        @placeholder["Name"]   = "例）太郎/\"次郎\""
        @placeholder["Skill"]  = "例）石投げ/\"ヒール\""
        @placeholder["Job"]  = "例）ナイト/\"旅行者\""
        @placeholder["ItemName"]   = "例）銅の剣/\"布の服\""
        @placeholder["Item"]   = "例）剣/\"着物\""
        @placeholder["ItemEffect"]   = "例）回復力/\"特殊効果\""
        @placeholder["ItemAbility"]   = "例）特性/\"記念品\""
        @placeholder["Timing"]   = "例）常時発動/戦型取得"
        @placeholder["Target"]   = "例）自分/敵単"
        @placeholder["SkillProperty"]   = "例）無/物/魔/技"
        @placeholder["Element"]   = "例）無/斬/突/熱"
        @placeholder["Place"]   = "例）キュースター/応礁"
        @placeholder["Event"]   = "例）配達任務/国籍"
    end
end
