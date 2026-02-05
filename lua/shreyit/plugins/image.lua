return {
	"3rd/image.nvim",
	opts = {
		-- WezTerm natively supports the Kitty protocol
		backend = "kitty",
		processor = "magick_cli",

		max_width = 100,
		max_height = 16, -- Slightly taller for better data viz
		window_overlap_clear_enabled = true,

		-- Inline mode for WezTerm
		only_render_image_at_cursor = false,
		render_geometry_fraction_50 = true,
	},
}
