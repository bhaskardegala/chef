bash 'downloading shopizer' do
    cwd '/opt/'
    code <<-EOH
    mkdir -p shopizer
    cd shopizer
    git clone git://github.com/shopizer-ecommerce/shopizer.git
    EOH
    action :run
    not_if { ::File.exist?'/opt/shopizer' }
end

