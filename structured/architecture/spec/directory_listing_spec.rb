require_relative "../helpers/application_helper"

RSpec.describe(ApplicationHelper::DirectoryListing) do
  include ApplicationHelper

  let(:dl_top)                 { ApplicationHelper::DirectoryListing.new('/') }
  let(:dl_public)              { ApplicationHelper::DirectoryListing.new('/public') }
  let(:dl_public_css)          { ApplicationHelper::DirectoryListing.new('/public/css') }
  let(:dl_public_css_main_css) { ApplicationHelper::DirectoryListing.new('/public/css/main.css') }

  it "shows a top-level directory properly" do
    expect(dl_top.send(:show_entry, '/')).to  be true
    expect(dl_top.send(:show_entry, '.')).to  be false
    expect(dl_top.send(:show_entry, '..')).to be false
  end
  it "shows an intermediate-level directory properly" do
    expect(dl_public.send(:show_entry, '/')).to  be true
    expect(dl_public.send(:show_entry, '.')).to  be false
    expect(dl_public.send(:show_entry, '..')).to be true
  end
  it "shows a lower-level directory properly" do
    expect(dl_public_css.send(:show_entry, '/')).to  be true
    expect(dl_public_css.send(:show_entry, '.')).to  be false
    expect(dl_public_css.send(:show_entry, '..')).to be true
  end
  it "shows a file properly" do
    expect(dl_public_css_main_css.send(:show_entry, '/')).to  be true
    expect(dl_public_css_main_css.send(:show_entry, '.')).to  be false
    expect(dl_public_css_main_css.send(:show_entry, '..')).to be true
  end

  it "renders a top-level directory properly" do
    expect(dl_top.send(:render_entry, '/')).to  eq("<a href='/'>/</a>")
    expect(dl_top.send(:render_entry, '..')).to eq("<a href='..'>..</a>")
    expect(dl_top.send(:render_entry, 'public')).to eq("<a href='public'>public</a>")
  end
  it "renders a lower-level directory properly" do
    expect(dl_public_css.send(:render_entry, '..')).to eq("<a href='..'>..</a>")
    expect(dl_public_css.send(:render_entry, 'main.css')).to eq("<a href='main.css'>main.css</a>")
  end
end
