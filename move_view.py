import sublime, sublime_plugin

class move_view_left(sublime_plugin.WindowCommand):
	def run(self):
		active_view = self.window.active_view()
		active_view_index = self.window.get_view_index(active_view)[1]
		total_views = len(self.window.views())
		if active_view_index > 0:
			self.window.set_view_index(active_view, self.window.active_group(), active_view_index - 1)
		else:
			self.window.set_view_index(active_view, self.window.active_group(), total_views - 1)

class move_view_right(sublime_plugin.WindowCommand):
	def run(self):
		active_view = self.window.active_view()
		active_view_index = self.window.get_view_index(active_view)[1]
		total_views = len(self.window.views())
		if active_view_index < total_views - 1:
			self.window.set_view_index(active_view, self.window.active_group(), active_view_index + 1)
		else:
			self.window.set_view_index(active_view, self.window.active_group(), 0)
