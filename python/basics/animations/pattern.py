from manim import *

class Pattern(Scene):
    def construct(self):
        title = Text("Pattern Program in Python")
        self.play(Write(title))
        #self.play(FadeOut(title))
        self.play(title.animate.to_corner(UL))


        program = MarkupText(f"<span foreground='{GREY}'># User input number of rows</span>\nrows = <span foreground='{BLUE}'>int</span>(<span foreground='{BLUE}'>input</span>(<span foreground='{GREEN}'>'Enter the number of rows: '</span>))\n\n<span foreground='{GREY}'># Count the Rows</span>\n<span foreground='{PINK}'>for</span> i <span foreground='{PINK}'>in</span> <span foreground='{BLUE}'>range</span>(rows):\n\t<span foreground='{GREY}'># Count the Columns</span>\n\t<span foreground='{PINK}'>for</span> j <span foreground='{PINK}'>in</span> <span foreground='{BLUE}'>range</span>(i + <span foreground='{YELLOW}'>1</span>):\n\t\t<span foreground='{BLUE}'>print</span>(f<span foreground='{GREEN}'>'&#123;i + 1&#125; '</span>, end=<span foreground='{GREEN}'>''</span>)\n\t<span foreground='{BLUE}'>print</span>()").scale(0.5).shift(LEFT * 2.9)
        line1 = program[0:22]
        line2 = program[22:62]
        line3 = program[62:75]
        line4 = program[75:93]
        line5 = program[93:109]
        line6 = program[109:126]
        line7 = program[126:148]
        line8 = program[148:155]

        self.play(AddTextLetterByLetter(program, run_time=3))
        # self.play(Indicate(line1, run_time=2, scale_factor=2, color=RED, opacity=0.5))
        # self.play(Indicate(line2, run_time=2, scale_factor=2, color=RED, opacity=0.5))
        # self.play(Indicate(line3, run_time=2, scale_factor=2, color=RED, opacity=0.5))
        # self.play(Indicate(line4, run_time=2, scale_factor=2, color=RED, opacity=0.5))
        # self.play(Indicate(line5, run_time=2, scale_factor=2, color=RED, opacity=0.5))
        # self.play(Indicate(line6, run_time=2, scale_factor=2, color=RED, opacity=0.5))
        # self.play(Indicate(line7, run_time=2, scale_factor=2, color=RED, opacity=0.5))
        # self.play(Indicate(line8, run_time=2, scale_factor=2, color=RED, opacity=0.5))
        arrow = MarkupText("<span>&#8594;</span>")

        #arrow.add_updater(lambda mob: mob.next_to(line1, LEFT))

        self.add(arrow.next_to(line1, LEFT, buff=0.08))
        self.play(Write(arrow))
        #arrow.add_updater(lambda mob: mob.next_to(line2, LEFT))
        #self.play(arrow.animate.move_to(line2.get_left() + LEFT * 0.35))
        #arrow.add_updater(lambda mob: mob.next_to(line3, LEFT))
        #self.play(arrow.animate.move_to(line3.get_left() + LEFT * 0.35))
        #arrow.add_updater(lambda mob: mob.next_to(line4, LEFT))
        #self.play(arrow.animate.move_to(line4.get_left() + LEFT * 0.35))
        #arrow.add_updater(lambda mob: mob.next_to(line5, LEFT))
        #self.play(arrow.animate.move_to(line5.get_left() + LEFT * 0.35))
        #arrow.add_updater(lambda mob: mob.next_to(line6, LEFT))
        #self.play(arrow.animate.move_to(line6.get_left() + LEFT * 0.35))
        #arrow.add_updater(lambda mob: mob.next_to(line7, LEFT))
        #self.play(arrow.animate.move_to(line7.get_left() + LEFT * 0.35))
        #arrow.add_updater(lambda mob: mob.next_to(line8, LEFT))
        #self.play(arrow.animate.move_to(line8.get_left() + LEFT * 0.35))

        term = Rectangle(height=4, width=5, fill_opacity=0.3, fill_color=GREY).shift(RIGHT * 4 + DOWN * 1.2)
        self.play(Create(term))

        cursor = MarkupText("|").scale(0.8).next_to(term.get_left())
        output = MarkupText("1\n2 2\n3 3 3\n4 4 4 4\n5 5 5 5 5\n").scale(0.6).next_to(term.get_left())
        outlist = [output[0:1], output[1:2], output[2:3], output[3:4], output[4:5], output[5:6], output[6:7], output[7:8], output[8:9], output[9:10], output[10:11], output[11:12], output[12:13], output[13:14], output[14:15]]
        cnt = 0
        li = MarkupText("i:0").scale(0.7).shift(DOWN * 0.1 + RIGHT * 0.1)
        lj = MarkupText("j:0").scale(0.7).shift(DOWN * 1.2 + RIGHT * 0.1)
        self.play(Write(li))
        self.play(Write(lj))
        for i in range(5):
            self.play(arrow.animate.move_to(line4.get_left() + LEFT * 0.35))

            lci = MarkupText(f"i:{i}").scale(0.7).shift(DOWN * 0.1 + RIGHT * 0.1)
            self.play(ReplacementTransform(li, lci))
            li = lci

            for j in range(i + 1):
                self.play(arrow.animate.move_to(line6.get_left() + LEFT * 0.35))

                lcj = MarkupText(f"j:{j}").scale(0.7).shift(DOWN * 1.2 + RIGHT * 0.1)
                self.play(ReplacementTransform(lj, lcj))
                lj = lcj

                self.play(arrow.animate.move_to(line7.get_left() + LEFT * 0.35))
                self.play(cursor.animate.move_to(outlist[cnt].get_right() + RIGHT * 0.12))
                self.play(Write(outlist[cnt]))
                cnt += 1

            self.play(arrow.animate.move_to(line8.get_left() + LEFT * 0.35))
            if cnt < 15:
                self.play(cursor.animate.move_to(outlist[cnt].get_left()))
            else:
                self.remove(cursor)
        self.wait(5)
